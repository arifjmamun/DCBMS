<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="DCBMS.UI.Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>AdminLTE 2 | Invoice</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="~/Template/bootstrap/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link href="~/Template/bootstrap/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="~/Template/bootstrap/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="~/Template/dist/css/AdminLTE.min.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            
            <asp:Panel ID="errorInfoPanel" runat="server" Visible="False">
                <h1>Invalid Request.</h1>
            </asp:Panel>

            <asp:Panel ID="InvoicePanel" runat="server" Visible="False">
                <!-- Main content -->
                <section class="invoice">
                    <!-- title row -->
                    <div class="row">
                        <div class="col-xs-12">
                            <h2 class="page-header">
                                <i class="fa fa-globe"></i>Diagonostic Center
                            </h2>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info">
                        <div class="col-sm-4 invoice-col">
                            To
                    <address>
                        <strong>Patient Name:
                            <asp:Label ID="patientNameLabel" runat="server" Text=""></asp:Label></strong><br />
                        Birth Date:
                        <asp:Label ID="birthDateLabel" runat="server" Text=""></asp:Label><br />
                        Phone Number:
                        <asp:Label ID="phoneNumberLabel" runat="server" Text=""></asp:Label>
                    </address>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                            <b>Bill Id: #<asp:Label ID="billIdLabel" runat="server" Text=""></asp:Label></b><br />
                            <br />
                            <b>Bill Date:</b>
                            <asp:Label ID="billDateLabel" runat="server" Text=""></asp:Label>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                    <!-- Table row -->
                    <div class="row">
                        <div class="col-xs-12 table-responsive">
                            <asp:GridView ID="billGridView" runat="server" ClientIDMode="Static" GridLines="None" CssClass="table table-striped" AutoGenerateColumns="True" ShowHeaderWhenEmpty="True">
                                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                            </asp:GridView>
                            <%--<table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Qty</th>
                                        <th>Product</th>
                                        <th>Serial #</th>
                                        <th>Description</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Call of Duty</td>
                                        <td>455-981-221</td>
                                        <td>El snort testosterone trophy driving gloves handsome</td>
                                        <td>$64.50</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Need for Speed IV</td>
                                        <td>247-925-726</td>
                                        <td>Wes Anderson umami biodiesel</td>
                                        <td>$50.00</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Monsters DVD</td>
                                        <td>735-845-642</td>
                                        <td>Terry Richardson helvetica tousled street art master</td>
                                        <td>$10.70</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Grown Ups Blue Ray</td>
                                        <td>422-568-642</td>
                                        <td>Tousled lomo letterpress</td>
                                        <td>$25.99</td>
                                    </tr>
                                </tbody>
                            </table>--%>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
            </asp:Panel>

        </div>
        <!-- ./wrapper -->
    </form>
</body>
</html>
