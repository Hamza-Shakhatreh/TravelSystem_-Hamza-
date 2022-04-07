<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication5._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .auto-style7 {
            text-align: center;
        }
        .title{
            padding:15px;
        }
        .auto-style8 {
            font-size: 60px;
        }
        .containar{
           background-color:white;        
          /*text-align:center;*/ 
           width:40%;
           margin:0 auto;
           border-radius:4px;
           color:#C0C0C0;
           
        }
        
        .auto-style10 {
            margin:0 auto;
           
            font-size:55px;
            color:#36413d
      
        }
        
        input[type=submit] {
          background-color: #36413d;
          color: white;
          border: none;
          border-radius: 2px;
          cursor: pointer;
          padding: 15px 35px;
          font-weight:bold;
          width:70%;
          
         
          
        
            
        
        }

        input[type=text], select, textarea {
          width: 65%;
          padding: 12px;
          border: 1px solid #ccc;
          border-radius: 4px;
          resize: vertical;
        }

        label {
          padding: 12px 12px 12px 0;
          display: inline-block;
        }

        table, tr, td{
         border:none;
         border-collapse: collapse;
        }
        table{
            text-decoration:none;
        }
        body{
            background-color:#36413d;
        }
    
        .auto-style12 {
            background-color: white; 
            width: 40%;
            margin: 0 auto;
            border-radius: 4px;
            color: #C0C0C0;
            text-align: center;
        }
        .singup{
            color:#36413d;
            text-decoration:none;
            font-size:large
        }
    
    </style>
</head>
<body>
         <div style="color:whitesmoke;" class="title auto-style7" >
            <strong><span class="auto-style8">International Travel Company</span></strong>
        </div>


            <br />
            <br />
            <br />
            <br />

    <form id="form1" runat="server">
        <div class="auto-style12">

            <div class="auto-style7">

               <br />
               <span  class="auto-style10"><strong>Login</strong>
               
                </span>
            </div>

            <br />
            <br />
         
            <asp:TextBox ID="TextBoxUser" placeholder="Username" runat="server" ></asp:TextBox>
                    
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="White" ControlToValidate="TextBoxUser" Display="Dynamic" ErrorMessage="Username is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    
            <br />
            <br /> 
            <br />


            <asp:TextBox ID="TextBoxPass" placeholder="Password" runat="server"></asp:TextBox>
           
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPass" Display="Dynamic" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
           
            <br />
            <br />
            <br />

            
             <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click"  />
      

            <br />
            <br />
            <br />

            <span style="font-size:large;color:#766f6f"> Not yet a member ?</span><a href="signup.aspx" class="singup"> Signup Now</a>

            <br />
            <br />

        </div>
      
    </form>

</body>
</html>
