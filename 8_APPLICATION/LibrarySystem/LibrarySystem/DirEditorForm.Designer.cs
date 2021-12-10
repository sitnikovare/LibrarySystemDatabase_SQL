
namespace LibrarySystem
{
    partial class DirEditorForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Authors = new System.Windows.Forms.Button();
            this.Genres = new System.Windows.Forms.Button();
            this.Publishings = new System.Windows.Forms.Button();
            this.InputForDirEdit = new System.Windows.Forms.TextBox();
            this.InputLabel = new System.Windows.Forms.Label();
            this.AddToDir = new System.Windows.Forms.Button();
            this.DeleteFromDir = new System.Windows.Forms.Button();
            this.TableViewer = new System.Windows.Forms.RichTextBox();
            this.BookDir = new System.Windows.Forms.Button();
            this.ReaderDir = new System.Windows.Forms.Button();
            this.showReaders = new System.Windows.Forms.Button();
            this.BookEdDir = new System.Windows.Forms.Button();
            this.showBookDir = new System.Windows.Forms.Button();
            this.showEditDir = new System.Windows.Forms.Button();
            this.shAuth = new System.Windows.Forms.Button();
            this.shGen = new System.Windows.Forms.Button();
            this.shPubl = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // Authors
            // 
            this.Authors.Location = new System.Drawing.Point(45, 38);
            this.Authors.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Authors.Name = "Authors";
            this.Authors.Size = new System.Drawing.Size(149, 38);
            this.Authors.TabIndex = 0;
            this.Authors.Text = "Авторы";
            this.Authors.UseVisualStyleBackColor = true;
            this.Authors.Click += new System.EventHandler(this.Authors_Click);
            // 
            // Genres
            // 
            this.Genres.Location = new System.Drawing.Point(45, 80);
            this.Genres.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Genres.Name = "Genres";
            this.Genres.Size = new System.Drawing.Size(149, 38);
            this.Genres.TabIndex = 1;
            this.Genres.Text = "Жанры";
            this.Genres.UseVisualStyleBackColor = true;
            this.Genres.Click += new System.EventHandler(this.Genres_Click);
            // 
            // Publishings
            // 
            this.Publishings.Location = new System.Drawing.Point(45, 122);
            this.Publishings.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Publishings.Name = "Publishings";
            this.Publishings.Size = new System.Drawing.Size(149, 38);
            this.Publishings.TabIndex = 2;
            this.Publishings.Text = "Издательства";
            this.Publishings.UseVisualStyleBackColor = true;
            this.Publishings.Click += new System.EventHandler(this.Publishings_Click);
            // 
            // InputForDirEdit
            // 
            this.InputForDirEdit.Location = new System.Drawing.Point(15, 334);
            this.InputForDirEdit.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.InputForDirEdit.Name = "InputForDirEdit";
            this.InputForDirEdit.Size = new System.Drawing.Size(189, 22);
            this.InputForDirEdit.TabIndex = 3;
            // 
            // InputLabel
            // 
            this.InputLabel.AutoSize = true;
            this.InputLabel.Location = new System.Drawing.Point(12, 315);
            this.InputLabel.Name = "InputLabel";
            this.InputLabel.Size = new System.Drawing.Size(238, 17);
            this.InputLabel.TabIndex = 4;
            this.InputLabel.Text = "Введите имя/название/ID издания:";
            // 
            // AddToDir
            // 
            this.AddToDir.Location = new System.Drawing.Point(51, 391);
            this.AddToDir.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.AddToDir.Name = "AddToDir";
            this.AddToDir.Size = new System.Drawing.Size(143, 38);
            this.AddToDir.TabIndex = 5;
            this.AddToDir.Text = "Добавить";
            this.AddToDir.UseVisualStyleBackColor = true;
            this.AddToDir.Click += new System.EventHandler(this.AddToDir_Click);
            // 
            // DeleteFromDir
            // 
            this.DeleteFromDir.Location = new System.Drawing.Point(211, 391);
            this.DeleteFromDir.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.DeleteFromDir.Name = "DeleteFromDir";
            this.DeleteFromDir.Size = new System.Drawing.Size(143, 38);
            this.DeleteFromDir.TabIndex = 6;
            this.DeleteFromDir.Text = "Удалить";
            this.DeleteFromDir.UseVisualStyleBackColor = true;
            this.DeleteFromDir.Click += new System.EventHandler(this.DeleteFromDir_Click);
            // 
            // TableViewer
            // 
            this.TableViewer.Location = new System.Drawing.Point(413, 38);
            this.TableViewer.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.TableViewer.Name = "TableViewer";
            this.TableViewer.ReadOnly = true;
            this.TableViewer.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.ForcedBoth;
            this.TableViewer.Size = new System.Drawing.Size(926, 351);
            this.TableViewer.TabIndex = 7;
            this.TableViewer.Text = "";
            // 
            // BookDir
            // 
            this.BookDir.Location = new System.Drawing.Point(223, 38);
            this.BookDir.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.BookDir.Name = "BookDir";
            this.BookDir.Size = new System.Drawing.Size(149, 38);
            this.BookDir.TabIndex = 8;
            this.BookDir.Text = "Книги";
            this.BookDir.UseVisualStyleBackColor = true;
            this.BookDir.Click += new System.EventHandler(this.BookDir_Click);
            // 
            // ReaderDir
            // 
            this.ReaderDir.Location = new System.Drawing.Point(223, 122);
            this.ReaderDir.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.ReaderDir.Name = "ReaderDir";
            this.ReaderDir.Size = new System.Drawing.Size(149, 38);
            this.ReaderDir.TabIndex = 9;
            this.ReaderDir.Text = "Читатели";
            this.ReaderDir.UseVisualStyleBackColor = true;
            this.ReaderDir.Click += new System.EventHandler(this.ReaderDir_Click);
            // 
            // showReaders
            // 
            this.showReaders.Location = new System.Drawing.Point(210, 260);
            this.showReaders.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.showReaders.Name = "showReaders";
            this.showReaders.Size = new System.Drawing.Size(182, 25);
            this.showReaders.TabIndex = 10;
            this.showReaders.Text = "Показать читателей";
            this.showReaders.UseVisualStyleBackColor = true;
            this.showReaders.Click += new System.EventHandler(this.showReaders_Click);
            // 
            // BookEdDir
            // 
            this.BookEdDir.Location = new System.Drawing.Point(223, 80);
            this.BookEdDir.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.BookEdDir.Name = "BookEdDir";
            this.BookEdDir.Size = new System.Drawing.Size(149, 38);
            this.BookEdDir.TabIndex = 11;
            this.BookEdDir.Text = "Издания";
            this.BookEdDir.UseVisualStyleBackColor = true;
            this.BookEdDir.Click += new System.EventHandler(this.BookEdDir_Click);
            // 
            // showBookDir
            // 
            this.showBookDir.Location = new System.Drawing.Point(211, 202);
            this.showBookDir.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.showBookDir.Name = "showBookDir";
            this.showBookDir.Size = new System.Drawing.Size(182, 25);
            this.showBookDir.TabIndex = 12;
            this.showBookDir.Text = "Показать книги";
            this.showBookDir.UseVisualStyleBackColor = true;
            this.showBookDir.Click += new System.EventHandler(this.showBookDir_Click);
            // 
            // showEditDir
            // 
            this.showEditDir.Location = new System.Drawing.Point(210, 231);
            this.showEditDir.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.showEditDir.Name = "showEditDir";
            this.showEditDir.Size = new System.Drawing.Size(182, 25);
            this.showEditDir.TabIndex = 13;
            this.showEditDir.Text = "Показать издания";
            this.showEditDir.UseVisualStyleBackColor = true;
            this.showEditDir.Click += new System.EventHandler(this.showEditDir_Click);
            // 
            // shAuth
            // 
            this.shAuth.Location = new System.Drawing.Point(23, 202);
            this.shAuth.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.shAuth.Name = "shAuth";
            this.shAuth.Size = new System.Drawing.Size(182, 25);
            this.shAuth.TabIndex = 14;
            this.shAuth.Text = "Показать авторов";
            this.shAuth.UseVisualStyleBackColor = true;
            this.shAuth.Click += new System.EventHandler(this.shAuth_Click);
            // 
            // shGen
            // 
            this.shGen.Location = new System.Drawing.Point(23, 231);
            this.shGen.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.shGen.Name = "shGen";
            this.shGen.Size = new System.Drawing.Size(182, 25);
            this.shGen.TabIndex = 15;
            this.shGen.Text = "Показать жанры";
            this.shGen.UseVisualStyleBackColor = true;
            this.shGen.Click += new System.EventHandler(this.shGen_Click);
            // 
            // shPubl
            // 
            this.shPubl.Location = new System.Drawing.Point(22, 260);
            this.shPubl.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.shPubl.Name = "shPubl";
            this.shPubl.Size = new System.Drawing.Size(182, 25);
            this.shPubl.TabIndex = 16;
            this.shPubl.Text = "Показать изд-ва";
            this.shPubl.UseVisualStyleBackColor = true;
            this.shPubl.Click += new System.EventHandler(this.shPubl_Click);
            // 
            // DirEditorForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1362, 483);
            this.Controls.Add(this.shPubl);
            this.Controls.Add(this.shGen);
            this.Controls.Add(this.shAuth);
            this.Controls.Add(this.showEditDir);
            this.Controls.Add(this.showBookDir);
            this.Controls.Add(this.BookEdDir);
            this.Controls.Add(this.showReaders);
            this.Controls.Add(this.ReaderDir);
            this.Controls.Add(this.BookDir);
            this.Controls.Add(this.TableViewer);
            this.Controls.Add(this.DeleteFromDir);
            this.Controls.Add(this.AddToDir);
            this.Controls.Add(this.InputLabel);
            this.Controls.Add(this.InputForDirEdit);
            this.Controls.Add(this.Publishings);
            this.Controls.Add(this.Genres);
            this.Controls.Add(this.Authors);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "DirEditorForm";
            this.Text = "Редактор справочников";
            this.Load += new System.EventHandler(this.DirEditorForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button Authors;
        private System.Windows.Forms.Button Genres;
        private System.Windows.Forms.Button Publishings;
        private System.Windows.Forms.TextBox InputForDirEdit;
        private System.Windows.Forms.Label InputLabel;
        private System.Windows.Forms.Button AddToDir;
        private System.Windows.Forms.Button DeleteFromDir;
        private System.Windows.Forms.RichTextBox TableViewer;
        private System.Windows.Forms.Button BookDir;
        private System.Windows.Forms.Button ReaderDir;
        private System.Windows.Forms.Button showReaders;
        private System.Windows.Forms.Button BookEdDir;
        private System.Windows.Forms.Button showBookDir;
        private System.Windows.Forms.Button showEditDir;
        private System.Windows.Forms.Button shAuth;
        private System.Windows.Forms.Button shGen;
        private System.Windows.Forms.Button shPubl;
    }
}