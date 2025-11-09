#!/usr/bin/env python3
import subprocess
import os
import sys
import mimetypes
import shutil
import copy

text_file = 'TXT.md'

image_encode_extension = '.png'
imagemagick_command = [
	'convert',
	'input path (automatically generated, do not edit)',
	'output path (automatically generated, do not edit)'
]
video_encode_extension = '.mp4'
audio_encode_extension = '.mp3'
ffmpeg_command = [
	'ffmpeg',
	'-i',
	'input path (automatically generated, do not edit)',
	'output path (automatically generated, do not edit)'
]

def main():
	if len(sys.argv) == 2:
		recursiveSearch(sys.argv[1])
		print('\nDone!')
	else:
		print("Usage: qqjournal_convert.py /path/to/journal")

def recursiveSearch(directory):
	for file in os.listdir(directory):
		file_path = os.path.join(directory, file)

		if os.path.isdir(file_path):
			print('DIRECTORY: ' + file_path)
			recursiveSearch(file_path)
			print()

		else:
			mimetype, encoding = mimetypes.guess_type(file_path)

			if mimetype is not None:

				if mimetype.startswith('image/gif'):
					print('converting: ' + file)
					doFileConversion(file_path, imagemagick_command, '.gif')
					if os.path.exists(os.path.join(directory, text_file)):
						fixMdAttachmentFilenames(os.path.join(directory, text_file), file, '.gif')

				elif mimetype.startswith('image/'):
					print('converting: ' + file)
					doFileConversion(file_path, imagemagick_command, image_encode_extension)
					if os.path.exists(os.path.join(directory, text_file)):
						fixMdAttachmentFilenames(os.path.join(directory, text_file), file, image_encode_extension)

				elif mimetype.startswith('video/'):
					print('converting: ' + file)
					doFileConversion(file_path, ffmpeg_command, video_encode_extension)
				if os.path.exists(os.path.join(directory, text_file)):
					fixMdAttachmentFilenames(os.path.join(directory, text_file), file, video_encode_extension)

				elif mimetype.startswith('audio/'):
					print('converting: ' + file)
					doFileConversion(file_path, ffmpeg_command, audio_encode_extension)
				if os.path.exists(os.path.join(directory, text_file)):
					fixMdAttachmentFilenames(os.path.join(directory, text_file), file, audio_encode_extension)


# doFileConversion: uses 'pandoc', 'magick', or 'ffmpeg' to convert .rtf, image, or video files
# 'command' parameter can be either pandoc_command, imagemagick_command, or ffmpeg_command
# 'extension' parameter can be either image_convert_extension or video_convert_extension
def doFileConversion(file_path, command, extension):
	# create copy of command (because it is passed by reference)
	local_command = copy.deepcopy(command)

	# setting up variables for readability
	file = os.path.basename(file_path)
	file_directory = os.path.dirname(file_path)

	# rename file to prevent errors if the input and output filenames are the same
	os.chdir(file_directory)
	os.rename(file, 'renamed-' + file)

	# find indices of 'input path' and 'output path' in command
	input_path_index = 0
	output_path_index = 0
	for (index, parameter) in enumerate(local_command):
		if parameter.startswith('input path'):
			input_path_index = index
		elif parameter.startswith('output path'):
			output_path_index = index

	# set 'input path' to renamed file and 'output path' to file with new extension
	# TODO!!! what if converted file already exists?
	local_command[input_path_index] = os.path.join(file_directory, 'renamed-' + file)
	local_command[output_path_index] = os.path.join(file_directory, os.path.splitext(file)[0] + extension)

	# perform CLI command
	output = subprocess.run(local_command, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
	if output.returncode != 0:
		raise Exception(output.stderr.decode())

	# remove renamed file
	os.remove('renamed-' + file)

# fixMdAttachmentFilenames: update each line that contains filename with filename that has new extension
# example:
# CONVERT FROM:
# ![grand haven.HEIC](grand%20haven.HEIC)
# CONVERT TO:
# ![grand haven.jpg](grand%20haven.jpg)
def fixMdAttachmentFilenames(md_path, file, extension):
	with open(md_path, 'r', errors='ignore') as f:
		data = f.readlines()

	file_20 = '%20'.join(file.split(' '))

	for (index, line) in enumerate(data):
		if file_20 in line:
			updated_line = line.replace(file, os.path.splitext(file)[0] + extension)
			# in cases where '%20' is used
			updated_line = updated_line.replace(file_20, os.path.splitext(file_20)[0] + extension)
			# Add: ATTACHMENT to file attachment alt text
			if 'ATTACHMENT:' not in updated_line:
				updated_line = updated_line.split('[')[0] + '[ATTACHMENT: ' + updated_line.split('[')[1]
			data[index] = updated_line

	with open(md_path, 'w', errors='ignore') as f:
		f.writelines(data)

if __name__ == '__main__':
	main()

