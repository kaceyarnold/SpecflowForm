<%@ Page Title="FAILURE!!!" Language="C#" AutoEventWireup="true" CodeBehind="failure.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SpecFlow.failure" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><% %>The Submitted Gherkin form has problems with the tag field</h2>
    <h3> Tags submitted do not contain a recognizable ui or api declaration.<br> You submitted;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </h3>
</asp:Content>
