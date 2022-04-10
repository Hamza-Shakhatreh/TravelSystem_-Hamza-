<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminadd.aspx.cs" Inherits="WebApplication5.adminadd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">        
        * {
            
  box-sizing: border-box;
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

input[type=submit] {
  background-color: #0275d8;
  color: white;
  padding: 12px 33px;
  border: none;
  border-radius: 2px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #07579b;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}


        .auto-style2 {
            float: left;
            width: 25%;
            height: 24px;
            margin-top: 0;
        }
       #TextBox1{
           display:none;
       }
       
         
       
        .title{
               text-align: center;
            padding:10px;
            font-size:20px;
        }

        .backBtn{
             text-decoration:none;
             background-color: #190940;
  color: white;
   padding: 10.9px 39px;
  border: none;
  border-radius: 2px;
  cursor: pointer;
  float: right;
  margin-right:5px;
         }
         .backBtn:hover{
             background-color:#0b041b;
         }


         

        </style>
</head>
<body style="width: 1446px; height: 345px">
     <div style="background-color:#190940;color:whitesmoke;" class="title" >
            <strong><span class="auto-style6">ADD Trip</span></strong>


        </div>
    <form id="form1" runat="server">

      <div class="container">
  
  <div class="row">
    <div class="auto-style2">
        <strong>
      <asp:Label ID="Label2" runat="server" Text="From"></asp:Label>
        </strong>&nbsp;&nbsp;
        </div>
    <div class="col-75">
     <asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFrom" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtFrom" Display="Dynamic" ErrorMessage="Must be String" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
    </div>
      </div>

          <div class="row">
    <div class="col-25">
        <strong>
      <asp:Label ID="Label3" runat="server" Text="To"></asp:Label>
        </strong>&nbsp;
        </div>
    <div class="col-75">
     <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTo" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtTo" Display="Dynamic" ErrorMessage="Must be String" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
    </div>
      </div>


          <div class="row">
    <div class="col-25">
        <strong>
     <asp:Label ID="Label4" runat="server" Text="Time Stamp"></asp:Label>
        </strong>&nbsp;&nbsp;
        </div>
    <div class="col-75">
     <asp:TextBox ID="txtTime" runat="server"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="26px" ImageUrl="~/img/calendar-icon.png" OnClick="ImageButton1_Click" Width="27px" />
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTime" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
      </div>


     <div class="row">
    <div class="col-25">
        <strong>
     <asp:Label ID="Label5" runat="server" Text="Currency"></asp:Label>
        </strong>&nbsp;&nbsp;
        </div>
    <div class="col-75">
     <asp:TextBox ID="TextBoxCurrency" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxCurrency" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBoxCurrency" Display="Dynamic" ErrorMessage="Must be String" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
    </div>
      </div>

          <div class="row">
    <div class="col-25">
        <strong>
     <asp:Label ID="Label6" runat="server" Text="Price"></asp:Label>
        </strong>&nbsp;&nbsp;
        </div>
    <div class="col-75">
     <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxPrice" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="TextBoxPrice" Display="Dynamic" ErrorMessage="Must be Valid Price" ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
    </div>
      </div>


             <div class="row">
    <div class="col-25">
        <strong>
     <asp:Label ID="Label7" runat="server" Text="Passengers Count"></asp:Label>
        </strong>&nbsp;&nbsp;
        </div>
    <div class="col-75">
     <asp:TextBox ID="TextBoxPassengers_Count" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxPassengers_Count" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="TextBoxPassengers_Count" Display="Dynamic" ErrorMessage="Must be Number" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
    </div>
      </div>
               <strong>
        <asp:Button ID="Button1" runat="server" Text="Add"  CssClass="auto-style3" OnClick="Button1_Click" />
               </strong>
         <a href="admin.aspx" class="backBtn" ><strong>Back</strong></a>&nbsp;





          </div>


        
    
    </form>
</body>
</html>