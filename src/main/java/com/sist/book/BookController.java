package com.sist.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import com.book.mgr.*;
@Controller
public class BookController {
    @Autowired
    private BookManager bm;
    @RequestMapping("book_main/list.do")
    public String book_main_list(String no,Model model)
    {
    	if(no==null)
    		no="0";
    	int i=Integer.parseInt(no);
    	if(i!=0)
    		i=i-1;
    	List<BookVO> list=bm.bookAllInfoData();
    	model.addAttribute("list", list);
    	model.addAttribute("data", list.get(i).getStrData());
    	return "book_main/list";
    }
    @RequestMapping("book_main/main.do")
    public String book_main(Model model)
    {
    	List<BookVO> list=bm.bookAllInfoData();
    	model.addAttribute("list", list);
    	return "book_main/main";
    }
    
}





