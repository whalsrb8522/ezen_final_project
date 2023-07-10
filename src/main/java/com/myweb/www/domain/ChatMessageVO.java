package com.myweb.www.domain;

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
public class ChatMessageVO {
	private int cm_number;
	private int cr_number;
	private int cm_send_m_number;
	private String cm_context;
	private String cm_send_date;
}
