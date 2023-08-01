package com.myweb.www.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class ProductReviewDTO {
	private ProductReviewVO prvo;
	private ProductVO pvo;
	private List<ProductImageVO> piList;
	private MemberVO mvo;
	private MemberImageVO mivo;
	private ChatRoomVO crvo;
}
