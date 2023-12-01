using System.Net;
using System.Net.Mail;

namespace CraigSwAPI.Email;

public class EmailSender : IEmailSender
{
    private readonly IConfiguration _config;
    public EmailSender(IConfiguration config)
    {
        _config = config;
    }
    public Task SendEmailAsync(string email, string subject, string message)
    {
        var emailpassword = _config["googlepassword"];
        var client = new SmtpClient("smtp.gmail.com", 587)
        {
            EnableSsl = true,
            UseDefaultCredentials = false,
            Credentials = new NetworkCredential("tailoredtoys47@gmail.com", emailpassword) 
        };

        return client.SendMailAsync(
            new MailMessage(from: "your.email@live.com",
                            to: email,
                            subject,
                            message
                            ));
    }
}