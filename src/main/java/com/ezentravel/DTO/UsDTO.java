package com.ezentravel.DTO;

// 유저 DTO
public class UsDTO {
	private String user_num;
	private String nickname;
	private String profile;


	public UsDTO(String user_num, String nickname) {
		super();
		this.user_num = user_num;
		this.nickname = nickname;
		this.profile = profile;

	}

	public String getUser_num() {
		return user_num;
	}

	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String toString() {
		return this.user_num + " " + this.nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
}
