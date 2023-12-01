using Microsoft.AspNetCore.Mvc;
using MythicalToyMachine.Data.DTOs;

namespace CraigSwAPI.Email;

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
    public async Task<IActionResult> Index(EmailInfoDto eid)
    {
        await emailSender.SendEmailAsync(eid.Email, eid.Subject, eid.Message);
        return Ok();
    }
}