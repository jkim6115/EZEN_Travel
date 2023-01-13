package com.ezentravel.DTO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UserDTO {
	private String id;
	private String nickname;
	private String email;
	private String gender;
	private String age_range;
	private String profile;
}
