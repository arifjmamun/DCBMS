<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TestSetup.aspx.cs" Inherits="DCBMS.UI.Test" %>

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
                        <h3 class="box-title">Test Setup</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="form-horizontal">
                        <div class="box-body">
                            <!--Test Name-->
                            <div class="form-group">
                                <label for="testNameTextBox" class="col-sm-offset-3 col-sm-2 control-label">Test Name</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="testNameTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <!--Fee-->
                            <div class="form-group">
                                <label for="feeTextBox" class="col-sm-offset-3 col-sm-2 control-label">Fee</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="feeTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <!--Test Type-->
                            <div class="form-group">
                                <label for="testTypeDropDown" class="col-sm-offset-3 col-sm-2 control-label">Test Type</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList ID="testTypeDropDown" runat="server" CssClass="form-control" ClientIDMode="Static">
                                        <asp:ListItem Text="Select One" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-5 col-sm-3">
                                    <asp:Button CssClass="btn btn-info pull-right" ID="saveTestBtn" runat="server" Text="Save" />
                                </div>
                            </div>
                            <hr />
                            <asp:GridView ID="testGridView" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
                                <Columns>
                                    <asp:BoundField DataField="slColumn" HeaderText="SL" />
                                    <asp:BoundField DataField="testNameColumn" HeaderText="Test Name" />
                                    <asp:BoundField DataField="feeColumn" HeaderText="Fee" />
                                    <asp:BoundField DataField="typeColumn" HeaderText="Type" />
                                </Columns>
                                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                            </asp:GridView>
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
