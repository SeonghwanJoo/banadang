package kr.spring.util;

public class LocationDistance {
	
	//lat1:첫번째 지점의 위도, lon1:첫번째 지점의 경도
	//lat1:두번째 지점의 위도, lon1:두번째 지점의 경도
	//e.g. 킬로미터(KiloMeter) 단위 double distanceKiloMeter =distance(37.504198, 127.047967, 37.501025, 127.037701, "kilometer");
    

	
    public static double processDistance(double lat1, double lon1, double lat2, double lon2, String unit) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        }
 
        return dist;
    }
     
 
    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }


}
