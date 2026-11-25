<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>手話試験対策(仮)</title>
<style>
h1 {
text-align: center;
}

#screen {
background-color: black;
width: 500px;
height: 300px;
margin: 30px auto;
display: flex;
justify-content: center;
align-items: center;
} 

p {
text-align: center;
}

#word-text {
color: white;
font-size: 50px;
margin:0;
}

#toggle-btn {
width: 200px;
height: 50px;
font-size: 30px;
}
 
</style>

</head>
<body>
<h1>手話試験対策(仮)</h1>

<div id="screen">
<div id="word-box"><p id="word-text"></p></div>
<div id="video-box"></div>
</div>

<p><button id="toggle-btn">スタート
</button></p>

<footer>
</footer>

<script>
'use strict'

// JavaのwordListを、JavaScriptの配列（オブジェクトのリスト）に変換して受け取る！
const words = [
    <c:forEach var="w" items="${wordList}" varStatus="status">
        {
            id: ${w.id},
            word: "${w.word}",
            url: "${w.url}",
            startSecond: ${w.startSecond},
            endSecond: ${w.endSecond}
        }<c:if test="${!status.last}">,</c:if>
    </c:forEach>
];

// ちゃんと受け取れたかコンソールで確認！
console.log(words);

//★1. 画面のパーツを取得しておく
const toggleBtn = document.getElementById('toggle-btn');
const wordBox = document.getElementById('word-box');
const wordText = document.getElementById('word-text');
const videoBox = document.getElementById('video-box');

let isRunning = false;
let timerId = null; // ★タイマーを途中で止めるためのIDを入れておく箱

//★2. ランダムに1問出して、2秒後に文字を隠す関数（まとまった処理）
function showNextWord() {
    // もしストップボタンが押されていたら何もしない
    if (isRunning === false) {
        return;
    }

 // ★★最初は動画を隠して空っぽにしておく
    videoBox.style.display = 'none';
    videoBox.innerHTML = '';

    // ① 配列からランダムに1つ選ぶ
    const randomIndex = Math.floor(Math.random() * words.length);
    const currentWord = words[randomIndex];

    // ② 文字をセットして画面に表示する
    wordText.textContent = currentWord.word;
    wordBox.style.display = 'block';

    // ③ 2秒後（2000ミリ秒後）に文字を隠すタイマーをセットする
    timerId = setTimeout(function() {
        wordBox.style.display = 'none';

     // ★★URLから動画ID（11文字）を切り出す
        const videoId = currentWord.url.split('youtu.be/')[1].split('?')[0];

        // ★★埋め込み用URLを組み立てる（自動再生・消音・開始秒・終了秒つき）
        const embedUrl = 'https://youtube.com/embed/' + videoId
            + '?autoplay=1&mute=1&controls=0&start=' + currentWord.startSecond
            + '&end=' + currentWord.endSecond;
        
        // ★★video-boxの中にiframeタグを入れて表示する
        videoBox.innerHTML = '<iframe width="500" height="300" src="' + embedUrl + '" allow="autoplay; encrypted-media" allowfullscreen></iframe>';
        videoBox.style.display = 'block';

        timerId = setTimeout(function() {
        	showNextWord();
            },(currentWord.endSecond - currentWord.startSecond) * 1000)
        
    }, 2000);
}

//3. ボタンがクリックされたときの処理
toggleBtn.onclick = function() {
    if (isRunning === false) {
        // スタート！
        isRunning = true;
        toggleBtn.textContent = 'ストップ';
        showNextWord(); // ★単語を表示する関数を呼び出す！
    } else {
        // ストップ！
        isRunning = false;
        toggleBtn.textContent = 'スタート';
        clearTimeout(timerId); // ★動いているタイマーを強制キャンセルする
        wordBox.style.display = 'none'; // 文字も隠して最初の黒画面に戻す
        videoBox.style.display = 'none'; // ★動画も隠す
        videoBox.innerHTML = '';   // ★動画の再生を完全に止める         
    }
};

</script>
</body>
</html>