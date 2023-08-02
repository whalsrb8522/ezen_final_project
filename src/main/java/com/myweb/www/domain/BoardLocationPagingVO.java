package com.myweb.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class BoardLocationPagingVO extends BoardLocationVO {
	private int pageNo;
	private int qty;
	private int pageCnt;  // 페이지네이션 개수
	
	public BoardLocationPagingVO() {
		this(1,15,10);
	}

	public BoardLocationPagingVO(int pageNo, int qty, int pageCnt) {
		this.pageNo = pageNo;
		this.qty = qty;
		this.pageCnt = pageCnt;
	}
	
	public int getPageStart() {
		return (this.pageNo-1)*qty;
	}
}
