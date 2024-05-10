package rentalcarServer.car.model;

public class CarDto {
	private String code;
	private String name;
	private String brand;
	private String region;
	private String fuel;
	private int seats;
	private int price;
	
	public CarDto() {
		
	}

	public CarDto(String code, String name, String brand, String region, String fuel, int seats, int price) {
		super();
		this.code = code;
		this.name = name;
		this.brand = brand;
		this.region = region;
		this.fuel = fuel;
		this.seats = seats;
		this.price = price;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}