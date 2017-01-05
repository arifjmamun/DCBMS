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
                            
                            <!--Alert goes here-->
                            <div class="col-sm-offset-3 col-sm-6">
                                <asp:Panel CssClass="alert alert-warning alert-dismissible" runat="server" ID="warningPanel" ClientIDMode="Static" Visible="False">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4 id="errorName" runat="server"></h4>
                                    <span runat="server" id="errorText"></span>
                                </asp:Panel>
                            </div>
                            <!--Alert ends-->

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
                                <div class="col-sm-1"><span>BDT</span></div>
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
                                    <asp:Button CssClass="btn btn-info pull-right" ID="saveTestBtn" runat="server" Text="Save" OnClick="saveTestBtn_Click" />
                                </div>
                            </div>
                            <hr />
                            <asp:GridView ID="testGridView" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
                                <Columns>
                                    <asp:BoundField DataField="test_id" HeaderText="SL" />
                                    <asp:BoundField DataField="test_name" HeaderText="Test Name" />
                                    <asp:BoundField DataField="test_fee" HeaderText="Fee" />
                                    <asp:BoundField DataField="test_type_name" HeaderText="Type" />
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
