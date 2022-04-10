<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book_Flight.aspx.cs" Inherits="WebApplication5.Book_Flight" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style6 {
            font-size: xx-large;
            
        }
        a{
            margin-left:10px;
            background-color:#feac00;
            color:black;
            text-decoration:none;
            padding:4px 4px;
        }
    .ColumnName{
        background-color:#190940;
        padding:10px;
        font-size:20px;
        color:white;
    }
   table{
       width:90%;
       border-collapse:separate;
       border-spacing:0 20px;
   }
   input[type=submit] {
  background-color: #5cb85c;
  color: white;
  border: none;
  border-radius: 2px;
  cursor: pointer;
  float: right;
  margin-right:100px;
  padding: 10px 25px;
}
   input[type=submit]:hover {
  background-color: #54aa54;
}

        .auto-style7 {
            text-align: center;
        }
        .title{
            padding:15px;
        }

        .editBtn{
            background-color: #0275d8;
    color: #fff;
    border-radius: 2px;
    padding: 8px 15px;
        }
        .editBtn:hover{
             background-color: #07579b;
        }

        .deleteBtn{
            background-color: #d9534f;
    color: #fff;
    border-radius: 2px;
    padding: 8px 15px;
        }
        .deleteBtn:hover{
               background-color:#c54e4a;
        }

        .auto-style8 {
            font-weight: bold;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server" >
        <div style="background-color:#190940;color:whitesmoke;" class="title auto-style7" >
            <strong><span class="auto-style6">Booking</span></strong>


        </div>
        <br />
       
        <br />
        <br />


        <div runat="server" style="margin:0 auto;">
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
            </div>
        <p>
       
            <strong>
       
        <asp:Button ID="Button1" runat="server" Text="Back"  CssClass="auto-style8" OnClick="Button1_Click"  />
       
            </strong>
       
        </p>
    </form>
</body>
</html>
