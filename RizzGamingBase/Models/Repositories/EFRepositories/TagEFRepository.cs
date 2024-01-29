﻿using RizzGamingBase.Models.EFModels;
using RizzGamingBase.Models.Entities;
using RizzGamingBase.Models.Exts;
using RizzGamingBase.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RizzGamingBase.Models.Repositories.EFRepositories
{
	public class TagEFRepository : ITagRepository
	{
		AppDbContext db = new AppDbContext();
		public void Create(TagEntity entity)
		{
			Tag model = entity.EntityToEF();
			db.Tags.Add(model);
			db.SaveChanges();
		}

		public void Delete(int id)
		{
			Tag model = db.Tags.Find(id);
			db.Tags.Remove(model);
			db.SaveChanges(); ;
		}

		public List<TagEntity> GetAll()
		{
			return db.Tags.AsNoTracking()
				.Select(d => d.EFToEntity())
				.ToList();
		}

		public List<TagEntity> GetAll(int id)
		{
			return db.GameTags.AsNoTracking()
				.Where(d => d.GameId == id)
				.Join(
				db.Tags,
				d => d.TagId,
				t => t.Id,
				(d, t) => t
				)
				.Select(d => d.EFToEntity())
				.ToList();
		}

		public TagEntity Search(int id)
		{
			return db.Tags.AsNoTracking()
				.Where(d => d.Id == id)
				.Select(d => d.EFToEntity())
				.Single();
		}


		public void Update(TagEntity entity)
		{
			Tag model = db.Tags.Find(entity.Id);

			entity.Name = model.Name;

			db.SaveChanges();
		}
	}
}