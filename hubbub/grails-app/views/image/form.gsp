<html>
    <head>
        <title>Upload Image</title>
        <meta name="layout" content="main"/>
    </head>
    <body>


        <g:uploadForm action="upload">

            User Id:
            <g:select name="userId" from="${currentUser}"
                      optionKey="userId" optionValue="userId" />
            <p/>
            Photo: <input name="photo" type="file" />
            <g:submitButton name="rawUpload" value="upload"/>
        </g:uploadForm>
                 testi: ${testi}

    probando: ${lastLocation?.altitude}

               
    </body>
</html>
