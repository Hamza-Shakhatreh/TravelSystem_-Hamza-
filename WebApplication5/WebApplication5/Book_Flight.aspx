<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book_Flight.aspx.cs" Inherits="WebApplication5.Book_Flight" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
  /* input[type=submit] {
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
}*/

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

        .deleteBtn {
            background-color: #d9534f;
            color: #fff;
            border-radius: 2px;
            padding: 8px 15px;
        }

            .deleteBtn:hover {
                background-color: #c54e4a;
            }

        .backBtn {
            background-color: #36413D;
            color: #fff;
            border-radius: 2px;
            padding: 8px 25px;
        }
        .backBtn:hover{
            background-color:#262d2a;

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

        .modalBackround {
            background-color: black;
            filter: alpha(opacity=0.9) !important;
            opacity: 0.6 !important;
            z-index: 20;
        }

        .modalPopup {
            padding: 20px 0px 24px 10px;
            position: relative;
            width: 450px;
            height: 66px;
            background-color: white;
            border: 1px solid black;
        }


        .auto-style9 {
            
            padding: 20px 0px 24px 10px;
            position: relative;
            width: 486px;
            height: 157px;
            background-color: white;
            border: 1px solid black;
            left: 0px;
            top: 0px;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server" >
        <div style="background-color:#190940;color:whitesmoke;" class="title auto-style7" >
            <strong><span class="auto-style6">Booking</span></strong>


        </div>
        <%--<br />
       
        <br />
        <br />


        <div runat="server" style="margin:0 auto;">
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
            </div>--%>
      

            <br />
            <br />
            <br />
        <center>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="14" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
               <%-- <Columns>
                   

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button CssClass="deleteBtn" ID="GVelemntBtn"  runat="server" Text="Update" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>--%>
                <Columns>

                        <asp:BoundField DataField="ID" HeaderText="Travel ID" />
                            <asp:BoundField DataField="From_Country" HeaderText="From" />
                            <asp:BoundField DataField="To_Country" HeaderText="To" />
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                            <asp:BoundField DataField="Currency_ISO" HeaderText="Currency" />
                            <asp:BoundField DataField="Time_Stamp" HeaderText="Trip Time" />


                    <asp:CommandField SelectText="Book" ShowSelectButton="True">
                    <ControlStyle CssClass="deleteBtn" />
                    <ItemStyle ForeColor="White" />
                    </asp:CommandField>

                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#190940" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
           
            <asp:HyperLink ID="HyperLink1" Style="display:none;" runat="server">HyperLink</asp:HyperLink>


            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:Panel ID="Panel2" runat="server" CssClass="auto-style9">

                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:Button ID="popUpCancelBtn" runat="server" CssClass="deleteBtn" Text="Cancel" />

            </asp:Panel>

            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="popUpCancelBtn" PopupControlID="Panel2" TargetControlID="HyperLink1" BackgroundCssClass="modalBackround"></ajaxToolkit:ModalPopupExtender>

            <p>
            <strong>
                <asp:Button ID="Button1" runat="server" Text="Back" CssClass="backBtn" OnClick="Button1_Click" />
            </strong>
            </p>

        </center>
        
       
        
    </form>
</body>
</html>
