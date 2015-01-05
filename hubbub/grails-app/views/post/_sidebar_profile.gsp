<div id="sidebar">

        <h3>Profile</h3>

            <dl>
                <dt><g:link controller="profile" action="show" id="${user?.id}">User</g:link> </dt>
                <dd>
                  <g:loggedInUserInfo field="userId">Guest</g:loggedInUserInfo>
                </dd>
            </dl>
            <g:isLoggedIn><g:link controller="logout" action="index">Logout</g:link></g:isLoggedIn>

        <h3>Stats</h3>

            <!-- Follower counts -->
            <dl>
                <!--
                <dt><a href='<g:createLink action="following" controller="friend" id="${user.userId}"/>'>
                    Following
                    </a>
                </dt>
                -->
				<dt><strong>Alerts</strong></dt>
                <dd>${user?.notifications?.alerts?.size()}</dd>
                <dt><g:link action="personal" controller="post">Posts</g:link> </dt>
                <dd>${user?.posts?.size()}</dd>
	            <dt><g:link action="personal" controller="location">Locations</g:link></dt>
                <dd>${user?.locations?.size()}</dd>
				<dt><g:link action="personal" controller="notification">Notifications</g:link></dt>
                <dd>${user?.notifications?.size()}</dd>
            </dl>

        <h3>Mates</h3>
        
            <!-- People I am following -->
            
            <div id="friendsThumbnails">
                <g:each var="myfriendship" in="${user?.following}">

	                <a href="<g:createLink action="profile" controller="user" id="${myfriendship?.userId}"/>">
                    <img src="<g:createLink action="tiny" controller="image" id="${myfriendship?.userId}"/>" alt="${myfriendship?.userId}"/></a></g:each>
                
            </div>
	  <g:if test="${user.friendrequest}">
	<h3>Friendship request</h3>

            <!-- People I am following -->

            <div id="friendsThumbnails">
                <g:each var="friendRequest" in="${user?.friendrequest}">

	                <a href="<g:createLink action="profile" controller="user" id="${friendRequest?.userId}"/>">
                    <img src="<g:createLink action="tiny" controller="image" id="${friendRequest?.userId}"/>" alt="${myfriendship?.toUser?.userId}"/></a></g:each>

            </div>
              </g:if>
            
<%--
    <div id="friendsThumbnails2">
                <g:each var="followUser" in="${following}">
                    <gui:toolTip text="${followUser.userId}">
                        <h:tinyThumbnail userId="${followUser.userId}"/>
                    </gui:toolTip>   
                </g:each>
            </div>

--%>


</div>
