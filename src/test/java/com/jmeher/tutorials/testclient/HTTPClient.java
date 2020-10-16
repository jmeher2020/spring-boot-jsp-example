package com.jmeher.tutorials.testclient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class HTTPClient {


	private static final String USER_AGENT = "Mozilla/5.0";
	private static final String SERVICE_URL = "http://localhost:8081/jmeher/";


	public static String sendPOST(String PATH, String POST_PARAMS) throws IOException {
		URL obj = new URL(SERVICE_URL + PATH);
		HttpURLConnection httpURLConnection = (HttpURLConnection) obj.openConnection();
		httpURLConnection.setRequestMethod("POST");
		httpURLConnection.setRequestProperty("User-Agent", USER_AGENT);

		httpURLConnection.setDoOutput(true);
		OutputStream os = httpURLConnection.getOutputStream();
		os.write(POST_PARAMS.getBytes());
		os.flush();
		os.close();


		int responseCode = httpURLConnection.getResponseCode();

		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			BufferedReader in = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in .readLine()) != null) {
				response.append(inputLine);
			} in .close();

			// return response
			return response.toString();
		} else {
			return "POST request not worked";
		}
	}


	public static String sendGET(String GET_URL) throws IOException {
		URL obj = new URL(SERVICE_URL+GET_URL);
		HttpURLConnection httpURLConnection = (HttpURLConnection) obj.openConnection();
		httpURLConnection.setRequestMethod("GET");
		httpURLConnection.setRequestProperty("User-Agent", USER_AGENT);
		int responseCode = httpURLConnection.getResponseCode();

		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			BufferedReader in = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in .readLine()) != null) {
				response.append(inputLine);
			} in .close();

			// return response
			return response.toString();
		} else {
			return "POST request not worked";
		}
	}
}
