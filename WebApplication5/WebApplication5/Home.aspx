<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication5.Home" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style6 {
            font-size: xx-large;
        }

        a {
          
            text-decoration: none;
            padding: 7px 15px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }
        a:hover{
             background-color: #c54e4a;
        }

        .ColumnName {
            background-color: #190940;
            padding: 10px;
            font-size: 20px;
            color: white;
        }

        table {
            width: 90%;
            border-collapse: separate;
            border-spacing: 0 20px;
        }

        .btn {
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            float: right;
            margin-right: 100px;
            padding: 10px 25px;
        }

            .btn:hover {
                background-color: #54aa54;
            }

        .auto-style7 {
            text-align: center;
        }

        .title {
            padding: 15px;
        }

        .editBtn {
            background-color: #0275d8;
            color: #fff;
            border-radius: 2px;
            padding: 8px 15px;
        }

            .editBtn:hover {
                background-color: #07579b;
            }

        .deleteBtn {
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            float: right;
            margin-right: 100px;
            padding: 10px 25px;
        }

            .deleteBtn:hover {
                background-color: #c54e4a;
            }

        .auto-style8 {
            font-weight: bold;
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
            width: 486px;
            height: 157px;
            background-color: white;
            border: 1px solid black;
            left: 0px;
            top: 0px;
        }

                 input[type=text], select, textarea {
          width: 65%;
          padding: 12px;
          border: 1px solid #ccc;
          border-radius: 4px;
          resize: vertical;
        }
  </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">

        </asp:ScriptManager>
        <div style="background-color: #190940; color: whitesmoke;" class="title auto-style7">
            <strong><span class="auto-style6">International Travel Company</span></strong>
        </div>

        <br />
        <br />
        <div runat="server" style="margin: 0 auto;">
            <asp:Panel ID="Panel1" runat="server">
                <center>
                    <asp:GridView runat="server" ID="TravelsGV" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="15" GridLines="Horizontal">
                        <columns>
                            <asp:BoundField DataField="ID" HeaderText="Travel ID" />
                            <asp:BoundField DataField="From_Country" HeaderText="From" />
                            <asp:BoundField DataField="To_Country" HeaderText="To" />
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                            <asp:BoundField DataField="Currency_ISO" HeaderText="Currency" />
                            <asp:BoundField DataField="Time_Stamp" HeaderText="Trip Time" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="CancelBtn" Text="Cancel" ToolTip="Cancel Trip" Font-Size="Larger" OnClick="CancelBtn_Click">
                                    </asp:LinkButton>

                                    <ajax:ModalPopupExtender   ID="CancelPopupMdl" CancelControlID="Button2" runat="server" TargetControlID="CancelBtn" PopupControlID="CancelPopupPanel" BackgroundCssClass="modalBackround"> </ajax:ModalPopupExtender>
                                    <asp:Panel ID="CancelPopupPanel" runat="server" modaPopupign="center" CssClass="modalPopup"   style = "display:none">
                                       <%--<iframe style=" width: 350px; height: 300px;" id="Iframe1" src='<%# "cancelTrip.aspx?tripID=" + Eval("ID")%>' runat="server"></iframe>--%>
                                        <%--<br />
                                        <asp:Label runat="server" Text='<%# "cancelTrip.aspx?tripID=" + Eval("ID")%>' />
                                        <br />
                                        <asp:Label runat="server" Text='<%# Eval("ID") %>' />
                                        <br />
                                        <asp:HiddenField ID="IdHiddenLbl" runat="server" Value='<%# Eval("ID") %>' />--%>
                                         
                                            <div class="container auto-style2">
                                                <br />
                                                <asp:TextBox ID="TextBoxReason" placeholder="Reason .. ?" runat="server" ></asp:TextBox>
                                                <br />
                                                <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBoxReason" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>--%>
                                                <br />
                                                <br />
                                                <strong>
                                                <asp:Button ID="CancelTripBtn" runat="server" OnClick="CancelTripBtn_Click" CommandArgument='<%# Eval("ID") %>' Text="Confirm" CssClass="btn" />
                                                <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="deleteBtn" />
                                                </strong>
                                                <br />
                                                <br />
                                            </div>
                                    </asp:Panel>
                                </ItemTemplate>
                                 <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </columns>
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
                    <br/>
                    <br/>
                    <asp:Button runat="server" CssClass="btn"  Text="Book A Trip" OnClick="Unnamed2_Click" />
                </center>
            </asp:Panel>
        </div>         
    </form>
</body>
</html>