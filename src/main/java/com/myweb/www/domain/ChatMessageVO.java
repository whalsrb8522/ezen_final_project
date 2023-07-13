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
	private int cm_sender;
	private int cm_receiver;
	private String cm_content;
	private String cm_send_date;
	private String cm_read_date;
}
