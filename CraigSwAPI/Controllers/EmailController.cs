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
    public async Task<IActionResult> SendEmail([FromBody] EmailInfoDto model)
    {
        if (model == null || !ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }

        await emailSender.SendEmailAsync(model.Email, model.Subject, model.Message);

        return Ok();
    }
}