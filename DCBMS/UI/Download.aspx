<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Download.aspx.cs" Inherits="DCBMS.UI.Download" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Template/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Template/bootstrap/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Template/bootstrap/css/ionicons.min.css" rel="stylesheet" />
    <link href="../Template/dist/css/AdminLTE.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel CssClass="row" runat="server" ID="invoiceWrapper" Visible="False">
            <!-- Main content -->
            <section class="invoice">
                <h2 align="center">Diagonostic Center Bill Management System </h2>
                <br />
                <small>Bill Date:
                    <asp:Label runat="server" ID="billdateLabel"></asp:Label>
                </small>
                <!-- info row -->
                <div class="row invoice-info">
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        To,
                        <br />
                        <strong>Name:
                            <asp:Label runat="server" ID="patientNameLabel"></asp:Label></strong><br />
                        Birth Date:
                        <asp:Label runat="server" ID="birthDateLabel"></asp:Label><br />
                        Mobile Number:
                        <asp:Label runat="server" ID="mobileNumberLabel"></asp:Label>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        <b>Bill No. #</b><asp:Label runat="server" ID="billIdLabel"></asp:Label><br />
                        <br />
                        <b>Total Amount:</b>
                        <asp:Label runat="server" ID="totalAmountLabel"></asp:Label><br />
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <!-- Table row -->
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <asp:GridView ID="patientBillGridview" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="Both" AutoGenerateColumns="False">
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
        </asp:Panel>
    </div>
    </form>
</body>
</html>
