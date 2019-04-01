Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO
Imports DevExpress.XtraPrinting
Imports System.Net.Mime
Imports DevExpress.XtraPrintingLinks

Namespace WebApplication1
	Partial Public Class _Default
		Inherits System.Web.UI.Page

		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

		End Sub

		Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As EventArgs)
			Using ms As New MemoryStream()
				Dim pcl As New PrintableComponentLinkBase(New PrintingSystemBase())
				pcl.Component = ASPxGridViewExporter1
'INSTANT VB WARNING: An assignment within expression was extracted from the following statement:
'ORIGINAL LINE: pcl.Margins.Left = pcl.Margins.Right = 50;
				pcl.Margins.Right = 50
				pcl.Margins.Left = pcl.Margins.Right
				pcl.Landscape = True
				pcl.CreateDocument(False)
				pcl.PrintingSystemBase.Document.AutoFitToPagesWidth = 1
				pcl.ExportToPdf(ms)
				WriteResponse(Me.Response, ms.ToArray(), System.Net.Mime.DispositionTypeNames.Inline.ToString())
			End Using
		End Sub
		Public Shared Sub WriteResponse(ByVal response As HttpResponse, ByVal filearray() As Byte, ByVal type As String)
			response.ClearContent()
			response.Buffer = True
			response.Cache.SetCacheability(HttpCacheability.Private)
			response.ContentType = "application/pdf"
			Dim contentDisposition As New ContentDisposition()
			contentDisposition.FileName = "test.pdf"
			contentDisposition.DispositionType = type
			response.AddHeader("Content-Disposition", contentDisposition.ToString())
			response.BinaryWrite(filearray)
			HttpContext.Current.ApplicationInstance.CompleteRequest()
			Try
				response.End()
			Catch e1 As System.Threading.ThreadAbortException
			End Try

		End Sub

		Protected Sub ASPxGridView1_CustomSummaryCalculate(ByVal sender As Object, ByVal e As DevExpress.Data.CustomSummaryEventArgs)

		End Sub

		Protected Sub ASPxGridView1_HtmlFooterCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs)

		End Sub

	End Class
End Namespace
