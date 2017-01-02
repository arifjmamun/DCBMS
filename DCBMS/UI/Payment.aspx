<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="DCBMS.UI.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
        <!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- right column -->
            <div class="col-md-12">
                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Payment</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="form-horizontal">
                        <div class="box-body">
                            <!--Bill No-->
                            <div class="form-group">
                                <label for="billNoTextBox" class="col-sm-offset-3 col-sm-2 control-label">Bill No.</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="billNoTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <span>Or</span>
                                </div>
                            </div>
                            <!--Mobile No.-->
                            <div class="form-group">
                                <label for="mobileNoTextBox" class="col-sm-offset-3 col-sm-2 control-label">Mobile No.</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="mobileNoTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button CssClass="btn btn-info" ID="searchBillInfoBtn" runat="server" Text="Search" />
                                </div>
                            </div>
                            <hr />
                             <!--Bill Amount-->
                            <div class="form-group">
                                <label for="billAmountTextBox" class="col-sm-offset-3 col-sm-2 control-label">Amount</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="billAmountTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <!--Due Date-->
                            <div class="form-group">
                                <label for="dueDateTextBox" class="col-sm-offset-3 col-sm-2 control-label">Date</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="dueDateTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button CssClass="btn btn-info" ID="payBillButton" runat="server" Text="Pay" />
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.box -->
            </div>
            <!--/.col (right) -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</asp:Content>
