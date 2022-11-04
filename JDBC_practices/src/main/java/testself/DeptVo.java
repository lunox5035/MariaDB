package testself;

public class DeptVo {
	private Long on;
	private String name;

	public Long getOn() {
		return on;
	}
	public void setOn(Long on) {
		this.on = on;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "DeptVo [on=" + on + ", name=" + name + "]";
	}
	
	
	
}
