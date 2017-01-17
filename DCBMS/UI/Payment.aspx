<%@ Page Title="Payment | DCBMS" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="DCBMS.UI.Payment" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="mainContent" runat="server">
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
                            
                            <!--Alert goes here-->
                            <div class="col-sm-offset-3 col-sm-6">
                                <asp:Panel CssClass="alert alert-warning alert-dismissible" runat="server" ID="warningPanel" ClientIDMode="Static" Visible="False">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4 id="errorName" runat="server"></h4>
                                    <span runat="server" id="errorText"></span>
                                </asp:Panel>
                            </div>
                            <!--Alert ends-->

                            <!--Bill No-->
                            <div class="form-group">
                                <label for="billNoTextBox" class="col-sm-offset-3 col-sm-2 control-label">Bill No.</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="billNoTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button CssClass="btn btn-info" ID="searchBillInfoBtn" runat="server" Text="Search" OnClick="searchBillInfoBtn_Click" />
                                </div>
                            </div>

                            <hr />

                            <asp:GridView ID="testInfoGridView" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" GridLines="None" ClientIDMode="Static" ShowHeaderWhenEmpty="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="SL">
                                        <ItemTemplate><%#Eval("TestSerial") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Test">
                                        <ItemTemplate><%#Eval("TestName") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fee">
                                        <ItemTemplate><%#Eval("TestFee") %></ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                            </asp:GridView>

                            <hr />
                            <!--Bill Date-->
                            <div class="form-group">
                                <label class="col-sm-offset-4 col-sm-2 control-label">Bill Date</label>
                                <label  class="col-sm-2 control-label pull-left"><asp:Label runat="server" Text="" ID="billDateLabel"></asp:Label></label>
                            </div>
                             <!--Total Fee-->
                            <div class="form-group">
                                <label class="col-sm-offset-4 col-sm-2 control-label">Total Fee</label>
                                <label  class="col-sm-2 control-label pull-left"><asp:Label runat="server" Text="" ID="totalFeeLabel"></asp:Label></label>
                            </div>
                             <!--Paid Amount-->
                            <div class="form-group">
                                <label class="col-sm-offset-4 col-sm-2 control-label">Paid Amount</label>
                                <label  class="col-sm-2 control-label pull-left"><asp:Label runat="server" Text="" ID="paidAmountLabel"></asp:Label></label>
                            </div>
                            <!--Due Amount-->
                            <div class="form-group">
                                <label class="col-sm-offset-4 col-sm-2 control-label">Due Amount</label>
                                <label class="col-sm-2 control-label pull-left"><asp:Label runat="server" Text="" ID="dueAmountLabel"></asp:Label></label>
                            </div>
                            <hr />
                            <!--Paying Amount-->
                            <div class="form-group">
                                <label for="amountTextBox" class="col-sm-offset-3 col-sm-2 control-label">Amount</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="amountTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button CssClass="btn btn-info" ID="payBillButton" runat="server" Text="Pay" OnClick="payBillButton_Click" />
                                </div>
                            </div>
                            <!--MessageLabel-->
                            <div class="form-group">
                                <label class="control-label col-sm-offset-3 col-sm-5"><asp:Label runat="server" ID="messageLabel" Text=""></asp:Label></label>
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
