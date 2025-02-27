﻿using RizzGamingBase.Models.Dtos;
using RizzGamingBase.Models.EFModels;
using RizzGamingBase.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RizzGamingBase.Models.Exts
{
	public static class GTExts
	{
		public static GTEntity EFToEntity(this GameTag model)
		{
			return new GTEntity
			{
				Id = model.Id,
				TagId = model.TagId,
				GameId = model.GameId
			};
		}

		public static GameTag EntityToEF(this GTEntity model)
		{
			return new GameTag
			{
				Id = model.Id,
				TagId = model.TagId,
				GameId = model.GameId
			};
		}

		public static GTDto EntityToDto(this GTEntity model)
		{
			return new GTDto
			{
				Id = model.Id,
				TagId = model.TagId,
				GameId = model.GameId
			};
		}

		public static GTEntity DtoToEntity(this GTDto model)
		{
			return new GTEntity
			{
				Id = model.Id,
				TagId = model.TagId,
				GameId = model.GameId
			};
		}
	}
}