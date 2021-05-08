package lol;

public class ChampionsVO {
	String name;
	String image;
	String lane;
	String winrate;
	String pickrate;
	String tier;
	String characteristic;
	//값을 넣을 때 사용하는 메서드 setters
	//값을 꺼낼 때 사용하는 메서드 getters
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLane() {
		return lane;
	}
	public void setLane(String lane) {
		this.lane = lane;
	}
	public String getWinrate() {
		return winrate;
	}
	public void setWinrate(String winrate) {
		this.winrate = winrate;
	}
	public String getPickrate() {
		return pickrate;
	}
	public void setPickrate(String pickrate) {
		this.pickrate = pickrate;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public String getCharacteristic() {
		return characteristic;
	}
	public void setCharacteristic(String characteristic) {
		this.characteristic = characteristic;
	}
	
}
