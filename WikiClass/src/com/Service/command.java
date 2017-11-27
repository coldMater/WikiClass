package com.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface command {
	public void execute(HttpServletRequest request, HttpServletResponse response);
}
