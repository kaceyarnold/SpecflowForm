<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SpecFlow.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Contact %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        1000 SW Broadway<br />
        Portland, OR 97002<br />
        <abbr title="Phone">P:</abbr>
        503-768-3715
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@accela.com">Support@accela.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@accela.com">Marketing@accela.com</a>
    </address>
</asp:Content>
