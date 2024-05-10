package rentalcarServer.car.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import rentalcarServer.util.DBManager;

public class CarDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CarDao() {
		
	}
	
	private static CarDao instance = new CarDao();
	
	// 3. 단일 인스턴스에 대한 getter 
	public static CarDao getInstance() {
		return instance;
	}
	
	public String[] getFuels() {
		String[] fuels = new String[0];
		int n = 0;
		
		for(int i = 0; i < getList().size(); i++) {
			CarDto car = getList().get(i);
			boolean isDupl = false;
			for(int j = 0; j < fuels.length; j++) {
				if(car.getFuel().equals(fuels[j]))
					isDupl = true;
			}
			if(isDupl)
				continue;
			
			String[] temp = fuels;
			fuels = new String[++n];
			int idx = 0;
			for(int j = 0; j < temp.length; j++) {
				fuels[idx++] = temp[j];
			}
			fuels[idx] = car.getFuel();
		}
		
		return fuels;
	}
	
	public String[] getRegions() {
		String[] regions = new String[0];
		int n = 0;
		
		for(int i = 0; i < getList().size(); i++) {
			CarDto car = getList().get(i);
			boolean isDupl = false;
			for(int j = 0; j < regions.length; j++) {
				if(car.getRegion().equals(regions[j]))
					isDupl = true;
			}
			if(isDupl)
				continue;
			
			String[] temp = regions;
			regions = new String[++n];
			int idx = 0;
			for(int j = 0; j < temp.length; j++) {
				regions[idx++] = temp[j];
			}
			regions[idx] = car.getRegion();
		}
		
		return regions;
	}
	
	public String[] getBrands() {
		String[] brands = new String[0];
		int n = 0;
		
		for(int i = 0; i < getList().size(); i++) {
			CarDto car = getList().get(i);
			boolean isDupl = false;
			for(int j = 0; j < brands.length; j++) {
				if(car.getBrand().equals(brands[j]))
					isDupl = true;
			}
			if(isDupl)
				continue;
			
			String[] temp = brands;
			brands = new String[++n];
			int idx = 0;
			for(int j = 0; j < temp.length; j++) {
				brands[idx++] = temp[j];
			}
			brands[idx] = car.getBrand();
		}
		
		return brands;
	}
	
	public List<CarDto> getList() {
		List<CarDto> list = new ArrayList<CarDto>();
		
		try {
			conn = DBManager.getConnection();
			
			String sql = "SELECT code, name, brand, region, fuel, seats, price FROM cars";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String code = rs.getString(1);
				String name = rs.getString(2);
				String brand = rs.getString(3);
				String region = rs.getString(4);
				String fuel = rs.getString(5);
				int seats = rs.getInt(6);
				int price = rs.getInt(7);
				
				CarDto car = new CarDto(code, name, brand, region, fuel, seats, price);
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
}