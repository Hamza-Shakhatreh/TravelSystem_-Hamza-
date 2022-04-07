<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="WebApplication5.signup" %>

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
            color:#36413D
      
        }
        
        input[type=submit] {
          background-color: #36413D;
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
            background-color:#36413D;
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
            color:#00C9A7;
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
            

    <form id="form1" runat="server">
        <div class="auto-style12">

            <div class="auto-style7">

               <br />
               <span  class="auto-style10"><strong>Signup</strong>
               
                </span>
            </div>

            <br />
          
         
            <asp:TextBox ID="TextBoxCivilID" placeholder="Civil ID" runat="server" ></asp:TextBox>
                    
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCivilID" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBoxCivilID" Display="Dynamic" ErrorMessage="Not valid Civil ID" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br />
          

            <asp:TextBox ID="TextBoxFullName" placeholder="Full Name" runat="server"></asp:TextBox>
           
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxFullName" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />

            <asp:TextBox ID="TextBoxAge" placeholder="Age" runat="server"></asp:TextBox>
           
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxAge" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBoxAge" Display="Dynamic" ErrorMessage="Not valid Age" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br />

             <asp:TextBox ID="TextBoxemail" placeholder="Email" runat="server"></asp:TextBox>
           
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxemail" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />

            <asp:TextBox ID="TextBoxPhone" placeholder="Phone Number" runat="server"></asp:TextBox>
           
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxPhone" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBoxPhone" Display="Dynamic" ErrorMessage="NOt valid Phone Number" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br />

            <asp:TextBox ID="TextBoxCountry" placeholder="Country" runat="server" Width="105px"></asp:TextBox>

            &nbsp;
            <asp:TextBox ID="TextBoxCity" placeholder="City" runat="server" Width="105px"></asp:TextBox>
             &nbsp;

            <asp:TextBox ID="TextBoxStreet" placeholder="Street" runat="server" Width="105px"></asp:TextBox>

            <br />
            <asp:CustomValidator ID="CustomValidator1" runat="server"  ErrorMessage="Required Fields" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" Display="Dynamic"></asp:CustomValidator>
            <br />

            <asp:TextBox ID="TextBoxPassword" placeholder="New Password" runat="server"></asp:TextBox>

            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            





            

            

          
          

            
             <asp:Button ID="Button1" runat="server" Text="Signup" OnClick="Button1_Click"   />
      

            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>" DeleteCommand="DELETE FROM [user] WHERE [CivilID] = @CivilID" InsertCommand="INSERT INTO [user] ([CivilID], [fullName], [age], [email], [phoneNumber], [country], [city], [street], [password], [userType]) VALUES (@CivilID, @fullName, @age, @email, @phoneNumber, @country, @city, @street, @password, @userType)" SelectCommand="SELECT * FROM [user]" UpdateCommand="UPDATE [user] SET [fullName] = @fullName, [age] = @age, [email] = @email, [phoneNumber] = @phoneNumber, [country] = @country, [city] = @city, [street] = @street, [password] = @password, [userType] = @userType WHERE [CivilID] = @CivilID">
                <DeleteParameters>
                    <asp:Parameter Name="CivilID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBoxCivilID" Name="CivilID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBoxFullName" Name="fullName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxAge" Name="age" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBoxemail" Name="email" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxPhone" Name="phoneNumber" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBoxCountry" Name="country" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxCity" Name="city" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxStreet" Name="street" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxPassword" Name="password" PropertyName="Text" Type="String" />
                    <asp:Parameter DefaultValue="0" Name="userType" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fullName" Type="String" />
                    <asp:Parameter Name="age" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="phoneNumber" Type="Int32" />
                    <asp:Parameter Name="country" Type="String" />
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="street" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="userType" Type="Boolean" />
                    <asp:Parameter Name="CivilID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />

           

            

        </div>
      
    </form>

</body>
</html>
