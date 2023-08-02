package com.myweb.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class ReviewPagingVO extends ProductReviewVO {
	private int pageNo;
	private int qty;
	private int pageCnt;  // 페이지네이션 개수
	
	private MemberVO mvo;
	
	public ReviewPagingVO() {
		this(1,15,10);
	}

	public ReviewPagingVO(int pageNo, int qty, int pageCnt) {
		this.pageNo = pageNo;
		this.qty = qty;
		this.pageCnt = pageCnt;
	}
	
	public int getPageStart() {
		return (this.pageNo-1)*qty;
	}
}
