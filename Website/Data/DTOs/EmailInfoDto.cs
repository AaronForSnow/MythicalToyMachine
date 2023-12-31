﻿using System.ComponentModel.DataAnnotations;

namespace MythicalToyMachine.Data.DTOs;

public class EmailInfoDto
{
    [Required]
    [EmailAddress]
    public string Email { get; set; }

    [Required]
    public string Subject { get; set; }

    [Required]
    public string Message { get; set; }
}
