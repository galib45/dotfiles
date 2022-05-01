
use std::path::Path;
use std::os::unix::fs::MetadataExt;
use crate::utils::utils::*;
use chrono::prelude::*;
use path_absolutize::*;

#[derive(Debug, Clone)]
pub struct FileInfo {
	pub pathstr: String,
	pub name: String,
	pub filetype: usize, // 0 = file, 1 = directory, 2 = symlink
	pub size: u64,
	pub humansize: String,
	pub perm_mask: String,
	pub username: String,
	pub mtime: DateTime<Local>,
	pub timestr: String,
	pub color: String,
}

impl FileInfo {
	pub fn new (argpath: &String, show_long: bool, show_size: bool) -> FileInfo {
		let path = Path::new(&argpath);
		let pathstr = String::from(path.absolutize().unwrap().to_str().unwrap());
		let mut name = pathstr.clone();
		if path.file_name() != None {
			name = String::from(path.file_name().unwrap().to_str().unwrap());
		}
		let metadata = path.metadata().unwrap();
		let mut filetype = 0;
		if path.symlink_metadata().unwrap().is_symlink() {
			filetype = 2;
		} else if metadata.is_dir() {
			filetype = 1
		}
		let mut size = 0;
		let mut humansize = String::from("");
		let perm_mask = unix_mode::to_string(metadata.mode());
		let mut username = String::from("");
		let mut timestr = String::from("");
		let mut color = String::from(C_RESET);
		let mut mtime = Local::now();

		if filetype == 2 {
		    color = String::from(C_CYAN);
		} else if filetype == 1 {
		    color = String::from(C_BLUE);
		} else if perm_mask.chars().nth(3) == Some('x') {
		    color = String::from(C_GREEN);
		}

		if show_long {
			if show_size {
				size = get_size(&pathstr);
				humansize = get_humansize(size);
			}
			let user = users::get_user_by_uid(metadata.uid()).unwrap();
			username = String::from(user.name().to_str().unwrap());
			mtime = DateTime::from(Utc.timestamp(metadata.mtime(), 0));
			timestr = mtime.format("%-d %b %H:%M").to_string();
			if Local::now().date().year() > mtime.date().year() {
				timestr = mtime.format("%-d %b  %Y").to_string();
			}
		}

		FileInfo {
			pathstr: pathstr,
			name: name,
			size: size,
			humansize: humansize,
			perm_mask: perm_mask,
			mtime: mtime,
			timestr: timestr,
			username: username,
			color: color,
			filetype: filetype
		}
	}

	
}
