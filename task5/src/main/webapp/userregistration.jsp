<!DOCTYPE html>
<html>
    <head>
        <title>employee register page</title>
    </head>
    <style>
        table{
            width: 50%;
            background-color:white;
        }
        tr td{
            padding: 20px;
            margin-top: 10px;
        }
        input{
            border: none;
        }
        .x{
            width: 80%;
            padding: 20px;
        }
    </style>
        <body bgcolor="wheat" align="center">
            <h1>employee registration form</h1>
            <form action="./afterregister.jsp" method="post">
                <table border="2" align="center" >
                <tr >
                    <td >Name:</td>
                    <td><input type="text" name="ename" placeholder="enter your name" class="x" ></td>
                </tr>
                <tr>
                    <td >email:</td>
                    <td><input type="text" name="eemail" placeholder="enter your email" class="x"></td>
                </tr>
                <tr>
                    <td >password:</td>
                    <td><input type="text" name="epassword" placeholder="enter your password" class="x" ></td>
                </tr>
                <tr>
                    <td >phone:</td>
                    <td><input type="text" name="ephonenumber" placeholder="enter your phone" class="x"></td>
                </tr>
                <tr>
                    <td >age:</td>
                    <td><input type="number" name="eage" placeholder="enter your age" class="x" ></td>
                </tr>
                <tr>
                    <td >dept:</td>
                    <td><input type="text" name="edept" placeholder="enter your department" class="x"></td>
                </tr>
                <tr>
                    <td >gender:</td>
                    <td><input type="radio" name="gender" value="male" >male<input type="radio" name="gender" value="female" >female</td>
                </tr>
            </table>
            <input type="submit" value="register" id="btn">
            </form>
        </body>
</html>
