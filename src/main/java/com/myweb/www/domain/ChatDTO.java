package com.myweb.www.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ChatDTO {
	private ChatRoomVO crvo;
	private ChatMessageVO lastCmvo;
	private List<ChatMessageVO> listCmvo;
	private MemberVO mvo;
}