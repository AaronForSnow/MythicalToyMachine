using CraigSwAPI.Email;
using Microsoft.AspNetCore.Mvc;



[ApiController]
[Route("email")]
public class EmailController : Controller
{
    private readonly IEmailSender emailSender;

    public EmailController(IEmailSender emailSender)
    {
        this.emailSender = emailSender;
    }

    [HttpPost]
    public async Task<IActionResult> Index(string email, string subject, string message)
    {
        await emailSender.SendEmailAsync(email, subject, message);
        return Ok();
    }
}