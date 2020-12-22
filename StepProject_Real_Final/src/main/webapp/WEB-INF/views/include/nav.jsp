<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<nav id="nav">
				<ul class="links">
					<li><a href="/">Home</a></li>
					<li><a href="/festivals/list?category=all">Festivals</a></li>
					<li><a href="/community/list">Community</a></li>
					<li><a href="/Review/list">Review</a></li>
					<% if (session.getAttribute("ID") == null)
                        {
							%>
					<br>
					<li>Guest 님 환영합니다.</li>
					<li><a href="/log/login">Login</a></li>
					<%
					}
					else
					{%>
					<br>
					<li><%= session.getAttribute("NAME")%> 님</li>
					<li><a href="/log/logout">LogOut</a></li>
                    <li><a href="/log/mypage">MyPage</a></li>
					<%
							if(session.getAttribute("ID").equals("yuhan2020"))
							{
							%>
								<li><a href="/admin/apply_festival">Apply</a></li>
							<%
							}
                        }
                    %>
				</ul>
			</nav>