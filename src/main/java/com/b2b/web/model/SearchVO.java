package com.b2b.web.model;

import java.util.Arrays;
import java.util.Date;
/*
import lombok.

@Data
*/
public class SearchVO extends Criteria {
/* 
 * Criteria 를 포함함 
 * BoardVO
 * public class SearchVO extends BoardVO {
 */	
	private String searchType;  // 검색 유형
    private String keyword;     // 검색 키워드
    
    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    /* BoardVO 를 포함하였으나 BoardVO 를 출력하지 않음..  다만, get/set으로 해당 값 반환/입력 가능 */	
    @Override
    public String toString() {
        return "SearchVO{" +
                "searchType='" + searchType + '\'' +
                ", keyword='" + keyword + '\'' +
                ", getPage='" + getPage() + '\'' +
               /* ", title='" + getTitle() + '\'' + */
                '}';
    }
}


