class MailTemplates {

  String getReplyMessageEmailTemplate(String reply) {
    return "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
  }

  String getAdminAccessMailHtmlContent() {
    return "<h1>Admin Access Privileges</h1>\n<p>Now you have admin access in flick</p>";
  }
}