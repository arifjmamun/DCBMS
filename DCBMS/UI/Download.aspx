<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Download.aspx.cs" Inherits="DCBMS.UI.Download" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill | DCBMS</title>
    <link href="../Template/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Template/bootstrap/css/Custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" runat="server" id="invoiceWrapper">
                <div class="table-responsive">
                    <!-- Main content -->
                    <table class="table table-striped">
                        <tr class="mar-top">
                            <td colspan="2" class="text-center">
                                <h2>Diagonostic Center Bill Management System </h2>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">
                                To,
                                <br />
                                <strong>Name:
                                    <asp:Label runat="server" ID="patientNameLabel"></asp:Label></strong><br />
                                Birth Date:
                                <asp:Label runat="server" ID="birthDateLabel"></asp:Label><br />
                                Mobile Number:
                                <asp:Label runat="server" ID="mobileNumberLabel"></asp:Label>
                            </td>
                            <td class="text-right">
                                <b>Bill Date:
                                    <asp:Label runat="server" ID="billdateLabel"></asp:Label></b><br />
                                <b>Bill No. #</b><asp:Label runat="server" ID="billIdLabel"></asp:Label><br />
                                <b>Total Amount:</b>
                                <asp:Label runat="server" ID="totalAmountLabel"></asp:Label><br />
                            </td>
                        </tr>
                    </table>
                </div>
                <section class="invoice mar-top">
                    <!-- Table row -->
                    <div class="row">
                        <div class="col-xs-12 table-responsive">
                            <asp:GridView ID="patientBillGridview" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="Both" AutoGenerateColumns="False" CellPadding="5">
                                <Columns>
                                    <asp:TemplateField HeaderText="SL">
                                        <ItemTemplate><%#Eval("TestSerial") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Test Name">
                                        <ItemTemplate><%#Eval("TestName") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fee">
                                        <ItemTemplate><%#Eval("TestFee") %></ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
            </div>
        </div>
    </form>
</body>
</html>
