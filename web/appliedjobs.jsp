<%-- 
    Document   : appliedjobs
    Created on : Apr 16, 2016, 4:19:31 PM
    Author     : S525108
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.ArrayList"%>
<%@ page import="login.MyJobs"%>
<html>
    <head>
        <link rel="shortcut icon" href="ojp.png" type="image/x-icon" /> 
        <title>Online Job Portal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link type="text/css" rel="stylesheet" href="home.css">

    </head>
    <body>
        <header>

            <!--------search button------->

            <span id="maincontent">
                <span> <a href="home.html">
                        <img src="ojp.png" alt="logo" class='logo' width="72" height="55">
                    </a>
                    <span class='title' > Online Job Portal </span>

                    <button type="button" value="Search"  id="Sbutton">Search</button>
                </span>
                <input type="text" name="search" class='search' placeholder="search"> </span>

            <span id="overlay"></span>
            <span id="popup">

                <span class="popupcontent"><br><br>
                    <span class="popupcontent_text">

                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <strong>SORRY! </strong><br><br>
                        &nbsp;&nbsp; Search option is not available right now</span>
                    <br><br>
                    <img src="Coming-Soon.png" alt="logo" class='logo' width="500" height="250">
                </span>
                <span class="popupcontrols">
                    <span id="popupclose"><input type="button" value="close search" class="popClose"></span>
                </span>
            </span>

            <!--------search button------->


            <!--------search button Java script------->
            <script type="text/javascript">

                // Initialize Variables
                var closePopup = document.getElementById("popupclose");
                var overlay = document.getElementById("overlay");
                var popup = document.getElementById("popup");
                var Sbutton = document.getElementById("Sbutton");
                // Close Popup Event
                closePopup.onclick = function () {
                    overlay.style.display = 'none';
                    popup.style.display = 'none';
                };
                // Show Overlay and Popup
                Sbutton.onclick = function () {
                    overlay.style.display = 'block';
                    popup.style.display = 'block';
                }
            </script>
            <!--------search button Java script------->

        </header>
        <div>
            <nav>
                <ul>
                    <li><a class="active" href="JobSearch.jsp">Home</a></li>
                    <li><a href="appliedjobs.jsp">Applied Jobs</a></li>
                    <li><a href="Consultancies.html">Consultancies</a></li>
                    <li><a href="help.html">Help</a></li>
                    <li><a href="contactus.html">Contact us</a></li>
                    <li><a href="myprofile.html">My profile</a></li>
                    <li style="float:right" class='right'><a href="welcome.jsp">Logout</a></li>

                </ul>
            </nav>

        </div>
        <br><br>
        <%
            ArrayList<MyJobs> specialList = (ArrayList<MyJobs>) session.getAttribute("myAppliedJobs");
//                System.out.println("In applied jobs" + specialList.get(0).getJobId());
            if (!specialList.isEmpty()) {
        %>
        <table class="table2">
            <tr>
                <th>Job ID</th>
                <th>Job Title</th>   
                <th>Description</th>  
                <th>Applied Date</th>
                <th>Status</th>
            </tr>

            <%
                for (MyJobs spl : specialList) {
            %>
            <tr>
                <td><%=spl.getJobId()%></td>
                <td><%=spl.getJobTitle()%></td>
                <td><%=spl.getJobDescription()%></td>
                <td><%=spl.getAppliedDate()%></td>
                <td><%=spl.getStatus()%></td>
            </tr>
            <%
                    }
                }%>
        </table>
        <%
        if (specialList.isEmpty()) {
        %>
        <h1 align="center">You have not yet applied jobs. Please apply for jobs to view them.</h1>
        <%
            }
        %>

    </body>
</html>
