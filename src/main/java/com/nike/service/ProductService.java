package com.nike.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.nike.product.ProductDAO;
import com.nike.product.ProductDTO;
import com.nike.product.Product_PagingVO;
import com.nike.product.Product_sizeDTO;


@Service
public class ProductService {
	@Autowired
	private ProductDAO Pdao;
	

	/*신발 코드로 검색 검색 결과 없다면 1 있다면 0*/
	public int codeSearch(Model model,String code) {
	   model.addAttribute("quickProduct", Pdao.codeSearch(code));
	   if(Pdao.codeSearch(code)==null) {
		   return 1;
	   }else {
		   return 0;
	   }
	}

	
	
	/*gender별 신발 전체 개수*/
	public int genderAll(String gender) {
		return Pdao.genderTotal(gender);
	}
	
	/*Category and gender별 신발 전체 개수*/
	public int categoryGenderAll(String gender,String category) {
		HashMap<String,String> hm = new LinkedHashMap<String, String>();
		hm.put("gender", gender);
		hm.put("category",category);
		return Pdao.categoryGenderTotal(hm);
	}
	
	/*신발 검색 전체 개수*/
	public int searchShose(String codename) {
		return Pdao.searchShose(codename);
	}

	/*남자 신발 전체 검색 및 컬러 조회*/
	public void allListMen(Model model,Product_PagingVO vo) {
		model.addAttribute("AllListMen", Pdao.allListMen(vo));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allList().size();i++) {
			hs.add(Pdao.allList().get(i).getCodename());
			al.add(Pdao.allList().get(i).getCodename());
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
		model.addAttribute("paging", vo);
		model.addAttribute("codeNameList", hm);
	}

	/*여자 신발 전체 검색*/
	public void allListWomen(Model model,Product_PagingVO vo) {
		model.addAttribute("allListWomen", Pdao.allListWomen(vo));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allList().size();i++) {
			hs.add(Pdao.allList().get(i).getCodename());
			al.add(Pdao.allList().get(i).getCodename());
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
		model.addAttribute("paging", vo);
		model.addAttribute("codeNameList", hm);
	}

	/*Kids 신발 전체 검색*/
	public void allListKids(Model model,Product_PagingVO vo) {
		model.addAttribute("allListKids", Pdao.allListKids(vo));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allList().size();i++) {
			hs.add(Pdao.allList().get(i).getCodename());
			al.add(Pdao.allList().get(i).getCodename());
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
		model.addAttribute("paging", vo);
		model.addAttribute("codeNameList", hm);
	}

	/*남자 신발 카테고리별 전체 검색*/
	public void allListMenCategory(Model model,Product_PagingVO vo) {
		
		model.addAttribute("AllListMenCategory", Pdao.allListMenCategoly(vo));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allList().size();i++) {
			hs.add(Pdao.allList().get(i).getCodename());
			al.add(Pdao.allList().get(i).getCodename());
		}
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
		model.addAttribute("paging", vo);
		model.addAttribute("codeNameList", hm);
	}
	
	/*여자 신발 카테고리별 전체 검색*/
	public void allListWomenCategory(Model model,Product_PagingVO vo) {
		model.addAttribute("AllListWomenCategory", Pdao.allListWomenCategoly(vo));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allList().size();i++) {
			hs.add(Pdao.allList().get(i).getCodename());
			al.add(Pdao.allList().get(i).getCodename());
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
		model.addAttribute("paging", vo);
		model.addAttribute("codeNameList", hm);
	}



	/*Kids 신발 카테고리별 전체 검색*/
	public void allListKidsCategory(Model model,Product_PagingVO vo) {
		model.addAttribute("AllListKidsCategory", Pdao.allListKidsCategoly(vo));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allList().size();i++) {
			hs.add(Pdao.allList().get(i).getCodename());
			al.add(Pdao.allList().get(i).getCodename());
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
		model.addAttribute("paging", vo);
		model.addAttribute("codeNameList", hm);
	}



	/*신발 전체 검색*/
	public void searchCode(Model model,Product_PagingVO vo) {
		model.addAttribute("searchCode", Pdao.searchCode(vo));
		HashSet<String> hs = new HashSet<String>();
		ArrayList<String> al = new ArrayList<String>();
		HashMap<String, Integer> hm = new LinkedHashMap<String, Integer>();
		for(int i =0 ; i<Pdao.allList().size();i++) {
			hs.add(Pdao.allList().get(i).getCodename());
			al.add(Pdao.allList().get(i).getCodename());
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
		model.addAttribute("paging", vo);
		model.addAttribute("codeNameList", hm);
	}

	/*상품 등록 기본 정보*/
	public void product_input(ProductDTO pdto) {
		Pdao.product_input(pdto);
	}
	/*상품 등록 사이즈별 수량*/
	public void product_size(Product_sizeDTO sizedto) {
		Pdao.product_size(sizedto);
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
	
	//장바구니에 대표사진 저장하는 기능
	public String image1get(String code) {
		return Pdao.image1get(code);
	}
	
	//장바구니에 상품명 저장하는 기능
	public String codnameget(String code) {
		return Pdao.codenameget(code);
	}
	
	//장바구니에 가격 저장하는 기능
	public int priceget(String code) {
		return Pdao.priceget(code);
	}


}
