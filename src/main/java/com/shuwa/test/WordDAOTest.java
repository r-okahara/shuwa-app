package com.shuwa.test;

import java.util.List;

import com.shuwa.dao.WordDAO;
import com.shuwa.model.Word;

public class WordDAOTest {
	public static void main(String[] args) {
		WordDAO dao = new WordDAO();
		List<Word> wordList = dao.findAll();

		for (Word w : wordList) {
			System.out.println(w.getWord());
		}
	}
}
