<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TypeWiseReport.aspx.cs" Inherits="DCBMS.UI.TypeWiseReport" %>

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
                        <h3 class="box-title">Type Wise Report</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="form-horizontal">
                        <div class="box-body">
                            <!--From Date-->
                            <div class="form-group">
                                <label for="fromDateTextBox" class="col-sm-offset-3 col-sm-2 control-label">From Date</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="fromDateTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <!--To Date-->
                            <div class="form-group">
                                <label for="toDateTextBox" class="col-sm-offset-3 col-sm-2 control-label">To Date</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="toDateTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button CssClass="btn btn-info" ID="showReportBtn" runat="server" Text="Show" />
                                </div>
                            </div>
                            <hr />
                            <asp:GridView ID="typeWiseReportGridView" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
                                <Columns>
                                    <asp:BoundField DataField="slColumn" HeaderText="SL" />
                                    <asp:BoundField DataField="testTypeNameColumn" HeaderText="TestSetup Type Name" />
                                    <asp:BoundField DataField="totalNoOfTestSetupColumn" HeaderText="Total No. Of TestSetup" />
                                    <asp:BoundField DataField="totalAmountColumn" HeaderText="Total Amount" />
                                </Columns>
                                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                            </asp:GridView>
                            <hr />
                            <!--Total-->
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-1">
                                    <asp:Button CssClass="btn btn-info pull-right" ID="generatePdfButton" runat="server" Text="PDF" />
                                </div>
                                <label for="totalTextBox" class="col-sm-2 control-label">Total</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="totalTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
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
