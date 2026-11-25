package com.shuwa.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.shuwa.model.Word;

public class WordDAO {

    public List<Word> findAll() {
        List<Word> wordList = new ArrayList<>();

        // db.propertiesから接続情報を読み込む
        Properties prop = new Properties();
        try (InputStream is = WordDAO.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (is == null) {
                throw new IllegalStateException("db.propertiesが見つかりませんでした");
            }
            prop.load(is);
        } catch (IOException e) {
            throw new IllegalStateException("db.propertiesの読み込みに失敗しました", e);
        }

        String jdbcUrl = prop.getProperty("jdbc.url");
        String dbUser = prop.getProperty("db.user");
        String dbPass = prop.getProperty("db.pass");

        // JDBCドライバの読み込み
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("JDBCドライバを読み込めませんでした");
        }

        // データベースへ接続（try-with-resourcesで自動的にクローズ）
        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass)) {


            // SELECT文の準備
            String sql = "SELECT id, word, url, start_second, end_second FROM words";
            PreparedStatement pStmt = conn.prepareStatement(sql);

            // SELECTを実行し、結果表を取得
            ResultSet rs = pStmt.executeQuery();

            // 結果表に格納されたレコードの内容をEntityに設定し、ArrayListに追加
            while (rs.next()) {
                int id = rs.getInt("id");
                String word = rs.getString("word");
                String url = rs.getString("url");
                int startSecond = rs.getInt("start_second");
                int endSecond = rs.getInt("end_second");

                Word wordEntity = new Word(id, word, url, startSecond, endSecond);
                wordList.add(wordEntity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return wordList;
    }
}