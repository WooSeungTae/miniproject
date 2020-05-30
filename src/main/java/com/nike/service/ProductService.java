package com.nike.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.ui.Model;

import com.nike.product.ProductDAO;


import com.nike.product.ProductDAO;
import com.nike.product.ProductDTO;
import com.nike.product.Product_sizeDTO;


@Service
public class ProductService {
	@Autowired
	private ProductDAO Pdao;
	/*남자 신발 전체 검색 및 컬러 조회*/
	public void allListMen(Model model) {
		model.addAttribute("AllListMen", Pdao.allListMen());
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allListMen().size();i++) {
			hs.add(Pdao.allListMen().get(i).getCodename());
			al.add(Pdao.allListMen().get(i).getCodename());
		}
		ArrayList<String> plist = new ArrayList<String>(hs);
		for(int i =0;i<plist.size();i++) {
			int count =0;
			for(int k=0;k<al.size();k++) {
				if(plist.get(i).equals(al.get(k))){
					count++;
					hm.put(plist.get(i),count);
					al.remove(k);
					k--;
					if(al.size()==0) break;
				}
						
			}
		}
		model.addAttribute("codeNameList", hm);
	}
	/*남자 신발 카테고리별 전체 검색*/
	public void allListMenCategory(Model model,String category) {
		model.addAttribute("AllListMenCategory", Pdao.allListMenCategoly(category));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allListMenCategoly(category).size();i++) {
			hs.add(Pdao.allListMenCategoly(category).get(i).getCodename());
			al.add(Pdao.allListMenCategoly(category).get(i).getCodename());
		}
		System.out.println(al);
		ArrayList<String> plist = new ArrayList<String>(hs);
		System.out.println(plist);
		for(int i =0;i<plist.size();i++) {
			int count =0;
			for(int k=0;k<al.size();k++) {
				if(plist.get(i).equals(al.get(k))){
					count++;
					hm.put(plist.get(i),count);
					al.remove(k);
					k--;
					if(al.size()==0) break;
				}
						
			}
		}
		model.addAttribute("codeNameList", hm);
	}
	
	/*신발 전체 검색*/
	public void searchCode(Model model,String codename) {
		model.addAttribute("searchCode", Pdao.searchCode(codename));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.searchCode(codename).size();i++) {
			hs.add(Pdao.searchCode(codename).get(i).getCodename());
			al.add(Pdao.searchCode(codename).get(i).getCodename());
		}
		ArrayList<String> plist = new ArrayList<String>(hs);
		for(int i =0;i<plist.size();i++) {
			int count =0;
			for(int k=0;k<al.size();k++) {
				if(plist.get(i).equals(al.get(k))){
					count++;
					hm.put(plist.get(i),count);
					al.remove(k);
					k--;
					if(al.size()==0) break;
				}
						
			}
		}
		model.addAttribute("codeNameList", hm);
	}
		
	
	/*여자 신발 전체 검색*/
	public void allListWomen(Model model) {
		model.addAttribute("allListWomen", Pdao.allListWomen());
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allListWomen().size();i++) {
			hs.add(Pdao.allListWomen().get(i).getCodename());
			al.add(Pdao.allListWomen().get(i).getCodename());
		}
		ArrayList<String> plist = new ArrayList<String>(hs);
		for(int i =0;i<plist.size();i++) {
			int count =0;
			for(int k=0;k<al.size();k++) {
				if(plist.get(i).equals(al.get(k))){
					count++;
					hm.put(plist.get(i),count);
					al.remove(k);
					k--;
					if(al.size()==0) break;
				}
						
			}
		}
		model.addAttribute("codeNameList", hm);
	}
	
	/*여자 신발 카테고리별 전체 검색*/
	public void allListWomenCategory(Model model,String category) {
		model.addAttribute("AllListWomenCategory", Pdao.allListWomenCategoly(category));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allListWomenCategoly(category).size();i++) {
			hs.add(Pdao.allListWomenCategoly(category).get(i).getCodename());
			al.add(Pdao.allListWomenCategoly(category).get(i).getCodename());
		}
		ArrayList<String> plist = new ArrayList<String>(hs);
		for(int i =0;i<plist.size();i++) {
			int count =0;
			for(int k=0;k<al.size();k++) {
				if(plist.get(i).equals(al.get(k))){
					count++;
					hm.put(plist.get(i),count);
					al.remove(k);
					k--;
					if(al.size()==0) break;
				}
						
			}
		}
		model.addAttribute("codeNameList", hm);
	}
	
	/*Kids 신발 전체 검색*/
	public void allListKids(Model model) {
		model.addAttribute("allListKids", Pdao.allListKids());
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allListKids().size();i++) {
			hs.add(Pdao.allListKids().get(i).getCodename());
			al.add(Pdao.allListKids().get(i).getCodename());
		}
		ArrayList<String> plist = new ArrayList<String>(hs);
		for(int i =0;i<plist.size();i++) {
			int count =0;
			for(int k=0;k<al.size();k++) {
				if(plist.get(i).equals(al.get(k))){
					count++;
					hm.put(plist.get(i),count);
					al.remove(k);
					k--;
					if(al.size()==0) break;
				}
						
			}
		}
		model.addAttribute("codeNameList", hm);
	}
	
	/*Kids 신발 카테고리별 전체 검색*/
	public void allListKidsCategory(Model model,String category) {
		model.addAttribute("AllListKidsCategory", Pdao.allListKidsCategoly(category));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allListKidsCategoly(category).size();i++) {
			hs.add(Pdao.allListKidsCategoly(category).get(i).getCodename());
			al.add(Pdao.allListKidsCategoly(category).get(i).getCodename());
		}
		ArrayList<String> plist = new ArrayList<String>(hs);
		for(int i =0;i<plist.size();i++) {
			int count =0;
			for(int k=0;k<al.size();k++) {
				if(plist.get(i).equals(al.get(k))){
					count++;
					hm.put(plist.get(i),count);
					al.remove(k);
					k--;
					if(al.size()==0) break;
				}
						
			}
		}
		model.addAttribute("codeNameList", hm);
	}
	
	public void product_input(Product_sizeDTO sizedto, ProductDTO dto) {
		Pdao.product_input(sizedto,dto);
	}

	/*세부 상품 조회*/
	public ProductDTO productdetail(String code) {
		return Pdao.productdetail(code);
	}
	

	
	//관리자 상품 목록 수정, 삭제를 위한 조회
	public ProductDTO productSelect(String code) {
		return Pdao.productSelect(code);
	}
		
	//관리자 상품 삭제하기 위한 기능
	public void productDelete(String code) {		
		Pdao.productDelete(code);	
	}


}
