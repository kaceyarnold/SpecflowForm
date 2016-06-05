<%@ Page Title="Success" Language="C#" AutoEventWireup="true" CodeBehind="success.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SpecFlow.success" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><% %>SpecFlow Form Submitted successfully</h2>
    <h3>Gherkin language test saved as
        <br />
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" ></asp:TextBox>
        .</h3>
    <p><a href="GherkinPage.aspx" class="btn btn-primary btn-lg">Input another acceptance criterion &raquo;</a></p>
</asp:Content>
