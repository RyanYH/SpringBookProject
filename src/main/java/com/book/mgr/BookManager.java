package com.book.mgr;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;
@Component
public class BookManager {
   public static void main(String[] arg)
   {
	   BookManager bm=new BookManager();
	   bm.bookAllInfoData();
   }
   public List<BookVO> bookAllInfoData()
   {
	   List<BookVO> list=new ArrayList<BookVO>();
	   try
	   {
		   Document doc=Jsoup.connect("http://www.bandinlunis.com/front/display/listBest.do").get();
		   Elements posterElem=doc.select("div.prod_thumb_img img");
		   Elements titleElem=doc.select("dl.prod_info dt a");
		   Elements totalElem=doc.select("dl.prod_info dd.txt_block");
		   Elements rankElem=doc.select("div.prod_thumb span.rank_num");
		   Elements reviewElem=doc.select("dl.prod_info dd.txt_bex");
		   Elements priceElem=doc.select("dd.mt5 span.txt_reprice");
		   Elements starElem=doc.select("dd.txt_desc strong");
		   for(int i=0;i<10;i++)
		   {
			   Element pe=posterElem.get(i);
			   String poster=pe.attr("src");
			   Element te=titleElem.get(i);
			   Element ae=totalElem.get(i);
			   Element rae=rankElem.get(i);
			   Element reve=reviewElem.get(i);
			   Element pre=priceElem.get(i);
			   Element se=starElem.get(i);
			   /*System.out.println(poster+" "+te.text()+" "+ae.text()+" "
			   +rae.text()+" "+reve.text()+" "+pre.text());*/
			   BookVO vo=new BookVO();
			   vo.setPoster(poster);
			   vo.setTitle(te.text());
			   vo.setRank(Integer.parseInt(rae.text()));
			   vo.setReview(reve.text());
			   vo.setPrice(pre.text());
			   StringTokenizer st=new StringTokenizer(ae.text(), "|");
			   vo.setAuthor(st.nextToken().trim());
			   vo.setPublisher(st.nextToken().trim());
			   vo.setRegdate(st.nextToken().trim());
			   vo.setStar(Double.parseDouble(se.text()));
			   String temp="[";
			   int[] data=new int[12];
			   for(int j=0;j<12;j++)
			   {
				   int rand=(int)(Math.random()*101);
				   //temp+=rand+",";
				   data[i]=rand;
				   temp+=data[i]+",";
			   }
			   temp=temp.substring(0,temp.lastIndexOf(','));
			   temp+="]";
			   vo.setStrData(temp);
			   //vo.setData(data);
			   list.add(vo);
		   }
		   
	   }catch(Exception ex)
	   {
		   System.out.println("bookAllInfoData:"+ex.getMessage());
	   }
	   return list;
   }
}






